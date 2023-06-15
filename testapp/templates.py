from typing import NamedTuple

from reactivated import template


@template
class TestPage(NamedTuple):
    name: str
    title: str
    greeting: str
