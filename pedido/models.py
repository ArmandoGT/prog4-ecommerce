from django.contrib.auth import get_user_model
from django.db import models

from catalogo.models import Produto


class Pedido(models.Model):
    user = get_user_model()
    cliente = models.ForeignKey(user, on_delete=models.CASCADE)
    criado = models.DateTimeField(auto_now_add=True)
    atualizado = models.DateTimeField(auto_now=True)
    pago = models.BooleanField(default=False)

    class Meta:
        ordering = ("-criado",)

    def __str__(self):
        return f'Pedido {self.id}'

    def get_total_geral(self):
        return sum(item.get_total() for item in self.itens_pedido.all())


class ItemPedido(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE,
                               related_name='itens_pedido')
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE,
                                related_name='itens_produto')
    preco_unit = models.DecimalField(max_digits=10, decimal_places=2)
    quantidade = models.PositiveIntegerField(default=1)

    class Meta:
        ordering = ('pedido',)
        verbose_name = 'Item Pedido'
        verbose_name_plural = 'Itens Pedido'

    def __str__(self):
        return f'Item {self.id} do Pedido {self.pedido.id}'

    def get_total(self):
        return self.preco_unit * self.quantidade