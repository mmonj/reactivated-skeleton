from django.urls import path

from . import views

app_name = "testapp"
urlpatterns = [
    path("", views.testpage, name="testpage"),
]
