from django.contrib import admin
from .models import Categoria, Produto

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ['nome', 'slug']
    prepopulated_field = {'slug':('nome',)}

@admin.register(Produto)
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ['categoria,' 'nome', 'preco', 'disponivel']
    list_filter = ['categoria', 'disponivel']
    list_editable = ('preco', 'disponivel')