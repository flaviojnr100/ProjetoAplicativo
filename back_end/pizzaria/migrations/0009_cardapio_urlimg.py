# Generated by Django 3.1.1 on 2020-10-13 17:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pizzaria', '0008_cardapio_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='cardapio',
            name='urlImg',
            field=models.CharField(blank=True, max_length=150),
        ),
    ]