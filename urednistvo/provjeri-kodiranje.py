"""Check all rendered chapters and text extracted from the print proof."""
from html import unescape
from pathlib import Path
import re
import sys

# Typical remnants of Croatian UTF-8 decoded as Windows-1250 or Windows-1252.
broken = re.compile(r"[\u00c2\u00c3\u00c4\u00c5\u0139\u013a][^\s]|\u00e2[\u20ac\u0080]|\ufffd")
pages = sorted(Path("_book").rglob("*.html"))
if not pages:
    sys.exit("Nedostaje mrežno izdanje.")
for path in [*pages, Path(sys.argv[1])]:
    content = unescape(path.read_text(encoding="utf-8"))
    if match := broken.search(content):
        sys.exit(f"{path}: {content[max(0, match.start()-20):match.end()+30]!r}")
