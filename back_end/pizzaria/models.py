from django.db import models

# Create your models here.
class Usuario(models.Model):
    nome = models.CharField(max_length=50,blank=False)
    sobrenome = models.CharField(max_length=50,blank=False)
    telefone = models.CharField(max_length=14,blank=True)
    email = models.CharField(max_length=50,blank=False)
    cidade = models.CharField(max_length=50,blank=True)
    bairro = models.CharField(max_length=50,blank=True)
    rua = models.CharField(max_length=50,blank=True)
    numero = models.CharField(max_length=10)
    complemento = models.CharField(max_length=250,blank=True)
    login = models.CharField(max_length=100,blank=False)
    senha = models.CharField(max_length=150,blank=False)
    tipo = models.CharField(max_length=15,blank=False)
    status = models.CharField(max_length=50,blank=False)
    data_criacao = models.DateField(null=True)

    def __str__(self):
        return self.nome

    def getJson(self):
        return {'id':self.id,'nome':self.nome,'sobrenome':self.sobrenome,
                'email':self.email,'telefone':self.telefone,'cidade':self.cidade,'bairro':self.bairro,
                'rua':self.rua,'numero':self.numero,'complemento':self.complemento,
                'login':self.login,'senha':self.senha,
                'tipo':self.tipo,'status':self.status,
                'data_criacao':self.data_criacao}

class Cardapio(models.Model):
    nome = models.CharField(max_length=30)
    preco = models.DecimalField(max_digits=20,decimal_places=2)
    ingredientes = models.CharField(max_length=500)
    tipo = models.CharField(max_length=50)
    status = models.CharField(max_length=50,blank=True)
    data_criacao = models.DateField()
    img = models.FileField(upload_to="",blank=True)

    def getJson(self):
        return {'id':self.id,'nome':self.nome,'preco':self.preco,
                'ingredientes':self.ingredientes,'tipo':self.tipo,'status':self.status,
                'data_criacao':self.data_criacao,'urlImg':str(self.img)}


class Pedido(models.Model):
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    total = models.DecimalField(max_digits=20,decimal_places=2,blank=True,default=0)
    mesa = models.CharField(max_length=4,blank=True)
    data_criacao = models.DateField()
    cardapios = models.ManyToManyField(Cardapio,unique=False,blank=True)

    def getJson(self):
        return {'id':self.id,'usuario':self.usuario.getJson(),'status':self.status,'total':self.total,'data_criacao':self.data_criacao,'n_mesa':self.mesa,'cardapios':[c.getJson() for c in self.cardapios.all()]}



