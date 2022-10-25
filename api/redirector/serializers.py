from . import models
from rest_framework import serializers

class ConnectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Connection
        fields = ['created', 'short_link', 'long_link']