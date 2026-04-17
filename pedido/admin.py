from django.contrib import admin
from .models import Pedido, ItemPedido

class PedidoItemInline(admin.TabularInline):
    model = ItemPedido
    raw_id_fields = ('produto',)
    extra = 2


@admin.register(Pedido)
class PedidoAdmin(admin.ModelAdmin):
    list_display = ('id', 'cliente', 'criado', 'pago')
    list_editable = ('pago',)
    list_filter = ['pago', 'cliente']
    inlines = [PedidoItemInline]
    raw_id_fields = ('cliente',)
