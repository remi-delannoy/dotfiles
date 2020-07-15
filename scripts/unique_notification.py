#!/usr/bin/python
import sys
import notify2
from pathlib import Path


def safe_index(container, element):
    return container.index(element) if element in container else None


notif_id_file = Path("/tmp/notif_id")
notif_id = 0
if notif_id_file.exists():
    with open(notif_id_file, "r") as f:
        notif_id = int(f.read())
notify2.init("test")
notif = notify2.Notification("")
notif.id = notif_id
if "-s" in sys.argv:
    notif.summary = " ".join(
        sys.argv[sys.argv.index("-s") + 1 : safe_index(sys.argv, "-m")]
    )
if "-m" in sys.argv:
    notif.message = " ".join(
        sys.argv[sys.argv.index("-m") + 1 : safe_index(sys.argv, "-t")]
    )
if "-t" in sys.argv:
    notif.timeout = int(sys.argv[sys.argv.index("-t") + 1])
notif.show()
with open(notif_id_file, "w") as f:
    f.write(str(notif.id))
