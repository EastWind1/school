package com.ian.media.dao;

import com.ian.media.model.Material;

import java.util.List;
import java.util.Map;

public interface MaterialMapper extends  BaseDao<Material,String> {
    public List getAllMaterial(Map map);
    
    public List getAllMaterialBypr(Map map);
}