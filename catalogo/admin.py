from django.contrib import admin
from .models import Categoria, Producto

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ['nome', 'slug']
    prepopulated_field = {'slug':('nome',)}

@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ['categoria', 'nome', 'preco', 'disponivel'] 
    list_filter = ['categoria', 'disponivel']
    list_editable = ('preco', 'disponivel')
    prepopulated_fields = {'slug': ('nome',)}