
abstract class Repository<T> {
  Future<void> add(T task);
  Future<void> update(T task);
  Future<void> delete(T task);
  Future<List<T>> getAll();
}
