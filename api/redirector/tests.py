from urllib import response
from django.test import TestCase
from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

class ConnectionsTestCase(APITestCase):
    def test_get_connections(self):
        response=self.client.get(reverse('connection-list'))
        self.assertEqual(response.status_code,status.HTTP_200_OK)
# Create your tests here.
