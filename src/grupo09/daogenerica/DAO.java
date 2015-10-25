package grupo09.daogenerica;

import java.util.List;

public interface DAO<T, PK> {
   public void guardar(T obj);
   public void eliminar(T obj);
   public List<T> listarTodos(Class<T> clase);
   public T daById(Class<T> clase, PK id);
}
