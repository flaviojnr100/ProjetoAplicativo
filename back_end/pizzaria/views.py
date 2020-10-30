import json
from ctypes import c_short

import requests
import os
from django.http import JsonResponse, HttpResponse
# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime

from projeto_pizzaria.settings import BASE_DIR
from .models import Usuario, Cardapio,Pedido




class ControllerCardapio:
    @csrf_exempt
    def cadastrar(self,request):

        nome = request.POST['nome']
        preco = request.POST['preco']
        ingredientes = request.POST['ingredientes']
        tipo = request.POST['tipo']
        status = request.POST['status']
        urlImg = "default.png"
        if len(request.FILES)==1:
            urlImg = request.FILES['file']



        cardapio = Cardapio(nome=nome,preco=preco,ingredientes = ingredientes,tipo=tipo,status = status,img = urlImg,data_criacao=datetime.now())

        cardapio.save()
        return HttpResponse("ok")

    def index(self,request):
        response = Cardapio.objects.order_by('-id')
        cardapios = [c.getJson() for c in response]

        return JsonResponse({'cardapios':cardapios})

    def getAll(self,request):
        pizzas = Cardapio.objects.filter(tipo='pizza',status="Ativo")
        pizzas = [c.getJson() for c in pizzas]
        hamburgueres = Cardapio.objects.filter(tipo="hamburguer",status="Ativo")
        hamburgueres = [c.getJson() for c in hamburgueres]
        pocoes = Cardapio.objects.filter(tipo="pocao",status="Ativo")
        pocoes = [c.getJson() for c in pocoes]
        bebidas = Cardapio.objects.filter(tipo="bebida",status="Ativo")
        bebidas = [c.getJson() for c in bebidas]
        return JsonResponse({'pizzas':pizzas,'hamburgueres':hamburgueres,'pocoes':pocoes,'bebidas':bebidas})
    @csrf_exempt
    def mudarStatus(self,request):
        id = request.POST['id']
        status = request.POST['status']
        cardapio = Cardapio.objects.get(id=id)
        cardapio.status = status
        cardapio.save()
        return HttpResponse("ok")
    @csrf_exempt
    def update(self,request):
        id = request.POST['id']
        response = Cardapio.objects.get(id=id)
        nome = request.POST['nome']
        preco = request.POST['preco']
        ingredientes = request.POST['ingredientes']
        tipo = request.POST['tipo']
        status = request.POST['status']
        if len(request.FILES)==1:
            if response.img != 'default.png':
                temp_img = response.img
                dir = os.listdir("{}/media".format(BASE_DIR))
                for file in dir:
                    if temp_img == file:
                        os.remove("{}/media/{}".format(BASE_DIR,file))
                        break

            urlImg = request.FILES['file']

            response.img = urlImg



        response.nome = nome
        response.preco = preco
        response.ingredientes = ingredientes
        response.tipo = tipo
        response.status = status

        response.save()

        return HttpResponse("ok")

class ControllerUsuario:
    @csrf_exempt
    def index(self,request):
        response = Usuario.objects.filter(tipo="usuario").order_by('-id')
        usuarios = [u.getJson() for u in response]
        return JsonResponse({'usuarios':usuarios})


    def indexFuncionario(self, request):
        response = Usuario.objects.filter(tipo="funcionario").order_by('-id')
        usuarios = [u.getJson() for u in response]
        return JsonResponse({'usuarios': usuarios})

    @csrf_exempt
    def mudarStatus(self,request):
        id = request.POST['id']
        status = request.POST['status']
        usuario = Usuario.objects.get(id=id)
        usuario.status = status
        usuario.save()
        return HttpResponse("ok")
    @csrf_exempt
    def verificarLogin(self,request):
        login = request.POST['login']
        resultado = Usuario.objects.filter(login=login).count()
        flag=False
        if resultado==1:
            flag = True
        return JsonResponse({'flag':flag})

    @csrf_exempt
    def verificarLoginEditar(self,request):
        login = request.POST['login']
        temp_login = request.POST['temp_login']
        resultado = Usuario.objects.filter(login=login).exclude(login=temp_login).count()
        flag=False
        if resultado==1:
            flag = True
        return JsonResponse({'flag':flag})

    @csrf_exempt
    def validarLogin(self,request):
        login = request.POST['login']

        senha = request.POST['senha']

        usuario = Usuario.objects.filter(login=login,senha=senha,status="Ativo")

        flag = False
        if len(usuario)==1:
            flag=True
            usuario = usuario.get()

            return JsonResponse({'flag': flag, 'dados': usuario.getJson()})
            
        else:
            return JsonResponse({'flag': flag,'dados':[]})

    @csrf_exempt
    def esqueciSenha(self,request):
        login = request.POST['login']
        email = request.POST['email']
        usuario = Usuario.objects.filter(login=login,email=email)
        if usuario.count()==1:
            usuario = usuario.get()
            usuario.senha = usuario.nome+usuario.sobrenome+"123"
            usuario.save()
            return JsonResponse({'senha':usuario.senha})
        else:
            return JsonResponse({'senha': ''})

    @csrf_exempt
    def cadastrar(self,request):
        nome = request.POST['nome']
        sobrenome = request.POST['sobrenome']
        telefone = request.POST['telefone']
        email = request.POST['email']
        bairro = request.POST['bairro']
        rua = request.POST['rua']
        numero = request.POST['numero']
        complemento = request.POST['complemento']
        login = request.POST['login']
        senha = request.POST['senha']
        tipo = request.POST['tipo']
        status = request.POST['status']


        cidade = request.POST['cidade']
        usuario = Usuario(nome=nome,sobrenome=sobrenome,telefone=telefone,email=email,cidade=cidade,bairro=bairro,rua=rua,numero=numero,complemento=complemento,login=login,senha=senha,tipo=tipo,status=status)
        usuario.save()
        return HttpResponse("ok")

    @csrf_exempt
    def editar(self,request):
        id = request.POST['id']
        nome = request.POST['nome']
        sobrenome = request.POST['sobrenome']
        telefone = request.POST['telefone']
        email = request.POST['email']
        cidade = request.POST['cidade']
        bairro = request.POST['bairro']
        rua = request.POST['rua']
        numero = request.POST['numero']
        complemento = request.POST['complemento']
        login = request.POST['login']
        senha = request.POST['senha']
        tipo = request.POST['tipo']
        status = request.POST['status']

        usuario = Usuario.objects.get(id=id)

        usuario.nome = nome
        usuario.sobrenome = sobrenome
        usuario.telefone = telefone
        usuario.email = email
        usuario.cidade = cidade
        usuario.bairro = bairro
        usuario.rua = rua
        usuario.numero = numero
        usuario.complemento = complemento
        usuario.login = login
        usuario.senha = senha

        usuario.save()
        return HttpResponse("ok")

class ControllerPedido:

    def index(self,request):
        pedidos = Pedido.objects.exclude(status="Cancelado").exclude(status="Aberto").order_by('-id')
        pedidos = [p.getJson() for p in pedidos]
        return JsonResponse({'pedidos':pedidos})

    @csrf_exempt
    def pedidoEspecificos(self,request):
        id_usuario = request.POST['id_usuario']

        pedidos = Pedido.objects.filter(usuario=id_usuario).order_by('-id')
        pedidos = [p.getJson() for p in pedidos]
        return JsonResponse({'pedidos': pedidos})



    @csrf_exempt
    def adicionarPedido(self,request):
        id_usuario = request.POST['id_usuario']
        id_cardapio = request.POST['id_cardapio']
        usuario = Usuario.objects.get(id=id_usuario)
        cardapio = Cardapio.objects.get(id=id_cardapio)
        resultado = Pedido.objects.filter(usuario = id_usuario,status='Aberto')

        if len(resultado)==0:
            pedido = Pedido(usuario = usuario,data_criacao = datetime.now(),status="Aberto",total=cardapio.preco)
            pedido.save()
            pedido.cardapios.add(cardapio)


        else:
            pedido = Pedido.objects.get(usuario=usuario,status='Aberto')
            pedido.total = pedido.total+cardapio.preco
            pedido.save()
            pedido.cardapios.add(cardapio)

        return HttpResponse("ok")
    @csrf_exempt
    def finalizarPedido(self,request):
        id_pedido = request.POST['id_pedido']
        status = request.POST['status']
        total = request.POST['total']

        pedido = Pedido.objects.filter(id=id_pedido).get()

        if len(request.POST)==4:
            n_mesa = request.POST['n_mesa']
            pedido.mesa = n_mesa




        pedido.status = status
        pedido.total = total

        pedido.save()
        return HttpResponse("ok")

    @csrf_exempt
    def mudarStatus(self,request):
        id_pedido = request.POST['id_pedido']
        status = request.POST['status']

        pedido = Pedido.objects.filter(id=id_pedido).get()
        pedido.status = status
        pedido.save()
        return HttpResponse("ok")

    @csrf_exempt
    def editarPedido(self,request):
        id_pedido = request.POST['id_pedido']
        id_cardapio = request.POST['id_cardapio']
        pedido = Pedido.objects.filter(id=id_pedido).get()
        deletar = pedido.cardapios.filter(id=id_cardapio)[0]
        deletar.delete()
        return HttpResponse("ok")

    @csrf_exempt
    def alterarPedido(self,request):
        id_pedido = request.POST['id_pedido']
        total = request.POST['total']
        mesa = request.POST['n_mesa']
        pedido = Pedido.objects.filter(id = id_pedido).get()
        pedido.total = total
        pedido.mesa = mesa
        pedido.save()
        return HttpResponse("ok")



class ControllerDashFuncionario:

    def index(self,request):
        totalUsuarios = Usuario.objects.filter(status="Ativo").count()
        totalCardapios = Cardapio.objects.filter().count()
        totalPedidosEntregues = Pedido.objects.filter(status="Entregue").count()
        totalPedidosPendentes = Pedido.objects.filter(status="Pendente").count()


        return JsonResponse({'t_usuarios':totalUsuarios,'t_cardapios':totalCardapios,'t_pedidosEntregues':totalPedidosEntregues,'t_pedidosPendentes':totalPedidosPendentes})
