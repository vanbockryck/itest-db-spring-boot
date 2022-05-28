package be.tekfoundry.itest.db.springboot;

import org.springframework.data.repository.CrudRepository;

public interface ITestsRepo extends CrudRepository<ITestEO, Integer> {
}
