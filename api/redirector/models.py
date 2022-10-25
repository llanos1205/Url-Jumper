from django.db import models

# Create your models here.
class Connection(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    short_link = models.TextField()
    long_link = models.TextField()
   
    class Meta:
        db_table = 'Connection'