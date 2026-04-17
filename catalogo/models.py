from django.db import models
import os


class ProdutosDisponiveisManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(disponivel=True)


class Categoria(models.Model):
    nome = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100)

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'
        ordering = ['nome']

    def __str__(self):
        return self.nome


def get_upload_path(instance, filename):
    slug = instance.slug
    ext = os.path.splitext(filename)[1]
    caminho = f'produtos/{slug}{ext}'
    return caminho


class Produto(models.Model):
    objects = models.Manager()
    disponiveis = ProdutosDisponiveisManager()
    nome = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100)
    descricao = models.TextField()
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE,
                                  related_name='produtos_categoria')
    imagem = models.ImageField(upload_to=get_upload_path, blank=True)
    disponivel = models.BooleanField(default=True)
    criado = models.DateTimeField(auto_now_add=True)
    atualizado = models.DateTimeField(auto_now=True)


    class Meta:
        ordering = ('categoria', 'nome')

    def __str__(self):
        return self.nome