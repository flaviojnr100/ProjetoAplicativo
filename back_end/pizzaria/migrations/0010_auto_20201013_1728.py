# Generated by Django 3.1.1 on 2020-10-13 20:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pizzaria', '0009_cardapio_urlimg'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='complemento',
            field=models.CharField(blank=True, max_length=250),
        ),
        migrations.AddField(
            model_name='usuario',
            name='telefone',
            field=models.CharField(blank=True, max_length=14),
        ),
    ]
