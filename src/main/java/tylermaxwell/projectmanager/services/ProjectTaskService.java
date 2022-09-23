package tylermaxwell.projectmanager.services;
import java.util.List;

import org.springframework.stereotype.Service;

import tylermaxwell.projectmanager.models.Task;
import tylermaxwell.projectmanager.repositories.TaskRepository;

@Service
public class ProjectTaskService {
    private final TaskRepository repo;

    public ProjectTaskService(TaskRepository repo) {
        this.repo = repo;
    }

    public List<Task> allTasks(){
        return repo.findAll();
    }

    public List<Task> projectTasks(Long projectId){
        return repo.findByProjectIdIs(projectId);
    }

    public Task addTask(Task task) {
        return repo.save(task);
    }

    public void deleteTask(Task task) {
        repo.delete(task);
    }
}