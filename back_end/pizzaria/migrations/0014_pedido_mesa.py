# Generated by Django 3.1.1 on 2020-10-28 01:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pizzaria', '0013_auto_20201026_2256'),
    ]

    operations = [
        migrations.AddField(
            model_name='pedido',
            name='mesa',
            field=models.CharField(blank=True, max_length=4),
        ),
    ]