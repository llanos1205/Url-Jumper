from django.shortcuts import render
from django.contrib.auth.models import User
from redirector import models,serializers
from rest_framework import generics
from rest_framework.permissions import IsAdminUser

class ConnectionList(generics.ListCreateAPIView):
    queryset = models.Connection.objects.all()
    serializer_class = serializers.ConnectionSerializer
