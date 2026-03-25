import os

import pytest


def pytest_addoption(parser):
    parser.addoption(
        "--chromedriver",
        action="store",
        default=None,
        help="Path to chromedriver (optional; current suite mocks Chrome)",
    )


def pytest_configure(config):
    path = config.getoption("--chromedriver", default=None)
    if path:
        os.environ["CHROMEDRIVER_PATH"] = path
