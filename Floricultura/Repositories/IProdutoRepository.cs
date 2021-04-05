using Floricultura.Models;
using System.Collections.Generic;

namespace Floricultura.Repositories
{
    public interface IProdutoRepository
    {
        void SaveProdutos(List<Livro> livros);
        IList<Produto> GetProdutos();
    }
}