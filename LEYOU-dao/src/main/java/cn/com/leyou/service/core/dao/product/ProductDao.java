package cn.com.leyou.service.core.dao.product;

import cn.com.leyou.core.pojo.product.Product;
import cn.com.leyou.core.pojo.product.ProductQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductDao {
    int countByExample(ProductQuery example);

    int deleteByExample(ProductQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductQuery example);

    Product selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductQuery example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductQuery example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}