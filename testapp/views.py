from django.http import HttpRequest, HttpResponse

from . import templates


def testpage(request: HttpRequest) -> HttpResponse:
    return templates.TestPage(
        name="Kenobi", title="General", greeting="Hello there",
    ).render(request)
