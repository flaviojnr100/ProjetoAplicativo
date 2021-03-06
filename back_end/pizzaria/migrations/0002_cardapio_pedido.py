# Generated by Django 3.1.2 on 2020-10-08 02:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pizzaria', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cardapio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=30)),
                ('preco', models.DecimalField(decimal_places=2, max_digits=20)),
                ('ingredientes', models.CharField(max_length=500)),
                ('tipo', models.CharField(max_length=50)),
                ('data_criacao', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Pedido',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=50)),
                ('data_criacao', models.DateField()),
                ('id_usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pizzaria.usuario')),
            ],
        ),
    ]
