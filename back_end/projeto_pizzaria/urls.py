"""projeto_pizzaria URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import  static
from pizzaria.views import ControllerUsuario, ControllerCardapio,ControllerPedido,ControllerDashFuncionario

controllerUsuario = ControllerUsuario()
controllerCardapio = ControllerCardapio()
controllerPedido = ControllerPedido()
controllerDashFuncionario = ControllerDashFuncionario()

urlpatterns = [
    path('admin/', admin.site.urls),
    path('usuario/index', controllerUsuario.index),
    path('usuario/esqueciSenha', controllerUsuario.esqueciSenha),
    path('usuario/indexFuncionario', controllerUsuario.indexFuncionario),
    path('usuario/cadastrar', controllerUsuario.cadastrar),
    path('usuario/editar', controllerUsuario.editar),
    path('usuario/mudarStatus', controllerUsuario.mudarStatus),
    path('usuario/verificarLogin', controllerUsuario.verificarLogin),
    path('usuario/verificarLoginEditar', controllerUsuario.verificarLoginEditar),
    path('auth/validarLogin', controllerUsuario.validarLogin),
    path('cardapio/cadastrar', controllerCardapio.cadastrar),
    path('cardapio/index', controllerCardapio.index),
    path('cardapio/editar', controllerCardapio.update),
    path('cardapio/getAll', controllerCardapio.getAll),
    path('cardapio/mudarStatus', controllerCardapio.mudarStatus),
    path('pedido/index', controllerPedido.index),
    path('pedido/showPedidos', controllerPedido.pedidoEspecificos),
    path('pedido/adicionarPedido', controllerPedido.adicionarPedido),
    path('pedido/finalizarPedido', controllerPedido.finalizarPedido),
    path('pedido/mudarStatus', controllerPedido.mudarStatus),
    path('pedido/editarPedido', controllerPedido.editarPedido),
    path('pedido/alterarPedido', controllerPedido.alterarPedido),
    path('dashFuncionario/index', controllerDashFuncionario.index),

]+ static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
