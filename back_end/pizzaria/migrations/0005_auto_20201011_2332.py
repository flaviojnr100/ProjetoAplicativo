# Generated by Django 3.1.1 on 2020-10-12 02:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pizzaria', '0004_auto_20201007_2348'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='data_criacao',
            field=models.DateField(blank=True),
        ),
    ]
