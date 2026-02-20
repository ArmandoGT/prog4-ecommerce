from django.db import models

class ProdutoDisponivelManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(disponivel=True)


class Categoria(models.Model):
    nome = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100)

    class Meta:
        verbose_name='Categoria'
        verbose_name_plural = 'Categorias'
        ordering = ('nome',)

        def __str__(self):
            return self.nome

class Producto(models.Model):
    objects = models.Manager()
    disponiveis = ProdutoDisponivelManager()
    nome = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100)
    descricao = models.TextField(max_length=500)
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name='produtos_categoria')
    imagem = models.ImageField(upload_to='produtos')
    disponivel = models.BooleanField(default=True)
    criado = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name='Produto'
        verbose_name_plural = 'Produtos'
        ordering = ('categoria', 'nome',)

        def __str__(self):
            return self.nome