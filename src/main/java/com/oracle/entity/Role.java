package com.oracle.entity;
public class Role {
    private Integer id;
    private String rolename;
    public Role() {
        super();
    }
    public Role(Integer id,String rolename) {
        super();
        this.id = id;
        this.rolename = rolename;
    }
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return this.rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

}
