from django.urls import path

from . import views

app_name = "testapp"
urlpatterns = [
    path("index/", views.testpage, name="testpage"),
]