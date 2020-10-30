from django.contrib import admin

# Register your models here.
from .models import Usuario,Pedido,Cardapio

admin.site.register(Usuario)
admin.site.register(Pedido)
admin.site.register(Cardapio)