from django.urls import path
from redirector import views
from . import views

urlpatterns = [
   path('connections/',views.ConnectionList().as_view(), name='connection-list')
 
]