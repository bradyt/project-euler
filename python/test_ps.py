
from datetime import datetime
from . import p001

def test_p001():
    tick = datetime.now()
    p001.main()
    tock = datetime.now()
    diff = tock - tick
    assert(diff.total_seconds() < 1)
