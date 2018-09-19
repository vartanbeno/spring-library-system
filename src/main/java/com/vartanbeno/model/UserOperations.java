package com.vartanbeno.model;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class UserOperations {

    private static final String USERS_XML = UserOperations.class.getClassLoader().getResource("users.xml").getFile();

    private static Users getListOfUsers() throws JAXBException, FileNotFoundException {
        JAXBContext context = JAXBContext.newInstance(Users.class);
        Unmarshaller unmarshaller = context.createUnmarshaller();
        return (Users) unmarshaller.unmarshal(new FileReader(USERS_XML));
    }

    public static List<User> getUsers() {
        List<User> userList = new ArrayList<>();
        try {
            userList = getListOfUsers().getUserList();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

    public static User getUser(String username, String password) {
        User user;
        try {
            user = getUsers().stream().filter(theUser -> theUser.getUsername().equals(username) && theUser.getPassword().equals(password)).collect(Collectors.toList()).get(0);
        }
        catch (IndexOutOfBoundsException e) {
            System.out.println("Incorrect username and/or password.");
            user = null;
        }
        return user;
    }

    @XmlRootElement(name = "users")
    private static class Users {

        @XmlElement(name = "user")
        List<User> users = new ArrayList<>();

        public List<User> getUserList() {
            return users;
        }

        public void setUserList(List<User> users) {
            this.users = users;
        }
    }

}
