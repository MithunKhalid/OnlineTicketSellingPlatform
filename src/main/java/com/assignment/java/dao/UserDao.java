package com.assignment.java.dao;

import com.assignment.java.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

    private SqlSessionFactory sqlSessionFactory;

    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public User loginUser(User user){

        SqlSession session = sqlSessionFactory.openSession();

        try {
            user = session.selectOne("userMapper.loginUser",user);
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        finally {
            session.close();
        }
        return user;

    }
}
