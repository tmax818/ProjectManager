package tylermaxwell.projectmanager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import tylermaxwell.projectmanager.models.Project;
import tylermaxwell.projectmanager.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    List<User> findAll();
    Optional<User> findByEmail(String email);
    User findByIdIs(Long id);
    List<User> findAllByProjects(Project project);
    List<User> findByProjectsNotContains(Project project);
}