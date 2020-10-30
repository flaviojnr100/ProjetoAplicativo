from django.db import models

# Create your models here.
class Usuario(models.Model):
    nome = models.CharField(max_length=50,blank=False)
    sobrenome = models.CharField(max_length=50,blank=False)
    email = models.CharField(max_length=50,blank=False)
    cidade = models.CharField(max_length=50,blank=True)
    bairro = models.CharField(max_length=50,blank=True)
    rua = models.CharField(max_length=50,blank=True)
    numero = models.IntegerField(blank=True)
    login = models.CharField(max_length=100,blank=False)
    senha = models.CharField(max_length=150,blank=False)
    tipo = models.CharField(max_length=15,blank=False)
    status = models.CharField(max_length=50,blank=False)
    data_criacao = models.DateField()

class Cardapio(models.Model):
    nome = models.CharField(max_length=30)
    preco = models.DecimalField(max_digits=20,decimal_places=2)
    ingredientes = models.CharField(max_length=500)
    tipo = models.CharField(max_length=50)
    data_criacao = models.DateField()

class Pedido(models.Model):
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    data_criacao = models.DateField()
    cardapios = models.ManyToManyField(Cardapio)



