"""Compare native CI builds against the macOS PDF and mark differing pixels."""

import argparse
import subprocess
from io import BytesIO
from pathlib import Path

from PIL import Image, ImageChops
from pypdf import PdfReader


def page_sizes(pdf):
    """Physical paper and visible page sizes in points, including rotation."""
    sizes = []
    for page in PdfReader(pdf).pages:
        dimensions = []
        for box in (page.mediabox, page.cropbox):
            width, height = box.width * page.user_unit, box.height * page.user_unit
            if page.rotation % 180 == 90:
                width, height = height, width
            dimensions.append((width, height))
        sizes.append(tuple(dimensions))
    if not sizes:
        raise ValueError(f"{pdf} has no pages")
    return sizes


def render(pdf, number):
    command = [
        "pdftoppm", "-r", "144", "-cropbox", "-singlefile",
        "-f", str(number), "-l", str(number), str(pdf),
    ]
    ppm = subprocess.run(command, check=True, stdout=subprocess.PIPE).stdout
    with Image.open(BytesIO(ppm)) as image:
        return image.convert("RGB")


def compare(artifacts, differences):
    platforms = ("Windows", "Linux")
    pdfs = {
        name: artifacts / f"paper-{name}" / "CUFEpaper.pdf"
        for name in ("macOS", *platforms)
    }
    sizes = {name: page_sizes(pdf) for name, pdf in pdfs.items()}
    reference = sizes["macOS"]
    passed = True
    for name in platforms:
        if len(sizes[name]) != len(reference):
            print(f"- {name} page count differs: macOS {len(reference)}, {name} {len(sizes[name])}.")
            passed = False

    for number, expected_size in enumerate(reference, start=1):
        expected = render(pdfs["macOS"], number)
        for name in platforms:
            if number > len(sizes[name]):
                continue
            size = sizes[name][number - 1]
            if size != expected_size:
                print(f"- {name} page {number} size differs (paper, visible area in pt): "
                      f"macOS {expected_size}, {name} {size}.")
                passed = False
                continue

            actual = render(pdfs[name], number)
            if actual.size != expected.size:
                print(f"- {name} page {number} raster size differs: macOS {expected.size}, {name} {actual.size}.")
                passed = False
                continue
            red, green, blue = ImageChops.difference(expected, actual).split()
            maximum = ImageChops.lighter(red, ImageChops.lighter(green, blue))
            mask = maximum.point(lambda value: 255 if value > 8 else 0)
            if mask.getbbox():
                differences.mkdir(parents=True, exist_ok=True)
                filename = f"{name}-page-{number}.png"
                actual.paste((255, 0, 0), mask=mask)
                actual.save(differences / filename)
                print(f"- {name} page {number} differs. Changed pixels are marked in `{filename}`.")
                passed = False

    if passed:
        print(f"Windows and Linux match all {len(reference)} macOS pages at 144 DPI.")
    return passed


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifacts", type=Path, help="directory containing the three paper-* artifacts")
    parser.add_argument("differences", type=Path, help="output directory for annotated PNGs")
    args = parser.parse_args()
    raise SystemExit(0 if compare(args.artifacts, args.differences) else 1)
