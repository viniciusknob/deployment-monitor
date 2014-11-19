package br.com.jarvis.model;

/**
 * <p>
 * Pattern Repository/Policy
 *
 * @param <E>
 *            O tipo de elemento desse repositorio
 */
public interface Repository<E> {
	
	/**
	 * Returns the element at the specified id in the data store.
	 * 
	 * @param id
	 *            id of the element to return
	 * @return the element at the specified id in the data store
	 */
	E get(long id);
	
	/**
	 * Appends the specified element to the data store.
	 * 
	 * @param e
	 *            element to be appended to the data store
	 * @return true if the data store changed as a result of the call
	 */
	boolean add(E e);
	
	/**
	 * Replaces the specified element to the data store.
	 * 
	 * @param e
	 *            element to be replaced to the data store
	 * @return true if the data store changed as a result of the call
	 */
	boolean set(E e);
	
	/**
	 * Removes the element at the specified id in the data store.
	 * 
	 * @param id
	 *            the id of the element to be removed
	 * @return true if the data store changed as a result of the call
	 */
	E remove(long id);
	
}
