package tylermaxwell.projectmanager.services;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import tylermaxwell.projectmanager.models.LoginUser;
import tylermaxwell.projectmanager.models.Project;
import tylermaxwell.projectmanager.models.User;
import tylermaxwell.projectmanager.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository repo;

    public User register(User newUser, BindingResult result) {

        Optional<User> potentialUser = repo.findByEmail(newUser.getEmail());

        // Reject if email is taken (present in database)
        if(potentialUser.isPresent()) {
            result.rejectValue("email", "Matches", "An account with that email already exists!");
        }

        // Reject if password doesn't match confirmation
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        // Return null if result has errors
        if(result.hasErrors()) {
            return null;
        }

        // Hash and set password, save user to database
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return repo.save(newUser);

    }

    public User login(LoginUser newLogin, BindingResult result) {

        Optional<User> potentialUser = repo.findByEmail(newLogin.getEmail());

        // Find user in the DB by email
        // Reject if NOT present
        if(!potentialUser.isPresent()) {
            result.rejectValue("email", "Matches", "User not found!");
            return null;
        }

        // User exists, retrieve user from DB
        User user = potentialUser.get();

        // Reject if BCrypt password match fails
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Matches", "Invalid Password!");
        }

        // Return null if result has errors
        if(result.hasErrors()) {
            return null;
        }

        // Otherwise, return the user object
        return user;

    }

    public List<User> allUsers(){
        return repo.findAll();
    }

    public User updateUser(User user) {
        return repo.save(user);
    }

    public List<User> getAssignedProjects(Project project){
        return repo.findAllByProjects(project);
    }

    public List<User> getunAssignedProjects(Project project){
        return repo.findByProjectsNotContains(project);
    }

    public User findById(Long id) {
        Optional<User> optionalUser = repo.findById(id);
        return optionalUser.orElse(null);
    }
}