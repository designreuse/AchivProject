package com.ita.softserveinc.achiever.service;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ita.softserveinc.achiever.api.EmailVerificationRequest;
import com.ita.softserveinc.achiever.api.PasswordRequest;
import com.ita.softserveinc.achiever.api.UpdateUserRequest;
import com.ita.softserveinc.achiever.entity.Group;
import com.ita.softserveinc.achiever.entity.Role;
import com.ita.softserveinc.achiever.entity.User;
import com.ita.softserveinc.achiever.exception.UserException;
import com.ita.softserveinc.achiever.tool.UserListForm;
import com.ita.softserveinc.achiever.tool.UserSearchRequestForm;

@Component
public interface IUserService {

	void create(User entity) throws UserException;

	User update(User entity);

	User updateName(String login, UpdateUserRequest updateUserRequest);

	User updateEmail(String login,
			EmailVerificationRequest emailVerificationRequest);

	User updatePassword(String login, PasswordRequest passwordRequest);

	User updateImage(String login, MultipartFile image);

	void delete(User entity);

	User findById(Long id);

	List<User> findAll();

	User findByLogin(String login);

	User findByEmail(String email);

	List<User> findAllByRole(String type);

	List<User> findManagers();

	Set<User> stringToManagers(String[] logins);

	List<User> findStudentsByGroup(Group group);

	List<User> findByActiveStatus();

	List<User> findByActiveStatusResultOnPage(int pageMax);

	List<User> findByActiveStatusPagination(int pagination, int maxResult);

	List<User> findByGroup(Group group);

	List<User> findStudentByGroupName(String groupName);

	List<User> findByGroup(Group group, Role role);

	List<User> findByDateOfCreating(int maxResult);

	boolean isOnlyUser(String login);

	List<User> findByRoleAndByGroup(String type, String groupName);

	List<User> findByLoginASC(int maxResult);

	List<User> findByFName(int maxResult);

	List<User> findByLName(int maxResult);
	
	List<User> findByUserRequest(UserSearchRequestForm searchRequest);

	void updateUsersByForm(UserListForm userListForm);

	Object findByDateOfCreating(int pagination, int maxResult);

}
