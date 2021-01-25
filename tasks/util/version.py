from os.path import join

from tasks.util.env import EXPERIMENT_ROOT

_version = None
_faabric_version = None


def get_version():
    global _version

    ver_file = join(EXPERIMENT_ROOT, "VERSION")

    if not _version:
        with open(ver_file, "r") as fh:
            _version = fh.read()
            _version = _version.strip()

        print("Read Experiment version: {}".format(_version))

    return _version


def get_faabric_version():
    global _faabric_version

    ver_file = join(EXPERIMENT_ROOT, ".env")

    if not _faabric_version:
        with open(ver_file, "r") as fh:
            _faabric_version = fh.readline()
            _faabric_version = _faabric_version.strip().split("=")[1]

    print("Read Faabric version: {}".format(_faabric_version))

    return _faabric_version
