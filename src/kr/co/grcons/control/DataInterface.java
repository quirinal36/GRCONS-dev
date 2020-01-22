/**
 * 
 */
package kr.co.grcons.control;

import java.util.List;

/**
 * @author turbo
 *
 */
public interface DataInterface <T>{
	public int insert(T input);
	public int update(T input);
	public T selectOnt(T param);
	public List<T> selectList(T param);
	public int delete(T input);
	public int count();
}
