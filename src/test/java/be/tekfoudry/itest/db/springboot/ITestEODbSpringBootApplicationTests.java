package be.tekfoudry.itest.db.springboot;

import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.testcontainers.containers.GenericContainer;
import org.testcontainers.images.builder.ImageFromDockerfile;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
@ContextConfiguration(initializers = {ITestEODbSpringBootApplicationTests.Initializer.class})
class ITestEODbSpringBootApplicationTests {

    @Autowired
    ITestsRepo repo;

    static class Initializer
            implements ApplicationContextInitializer<ConfigurableApplicationContext> {
        public void initialize(ConfigurableApplicationContext configurableApplicationContext) {

            // This does not seem the right place to start the container, but I don't know how to set the correct host:port otherwise...
            GenericContainer dbContainer = startContainer();

            TestPropertyValues.of(
                    "spring.datasource.url=jdbc:postgresql://" + dbContainer.getHost() + ":" + dbContainer.getFirstMappedPort() + "/itests"
            ).applyTo(configurableApplicationContext.getEnvironment());
        }

        @NotNull
        private GenericContainer startContainer() {
            ImageFromDockerfile image = new ImageFromDockerfile("db-itests")
                    .withFileFromClasspath("aa-init-db.sql", "test-containers/itests-db/init-db.sql")
                    .withFileFromClasspath("bb-test-data.sql", "test-containers/itests-db/test-data.sql")
                    .withDockerfileFromBuilder(builder ->
                            builder
                                    .from("postgres:14-alpine")
                                    // SQL init scripts are executed in alphabetical order - hence the prefixes ('aa','bb').
                                    .copy("aa-init-db.sql", "/docker-entrypoint-initdb.d/")
                                    .copy("bb-test-data.sql", "/docker-entrypoint-initdb.d/")
                                    .build());

            GenericContainer dbContainer = new GenericContainer(image)
                    .withExposedPorts(5432)
                    .withEnv("POSTGRES_USER", "postgres")
                    .withEnv("POSTGRES_PASSWORD", "postgres");

            dbContainer.start();
            return dbContainer;
        }

    }

    @Test
    void testTheRepositoryMethodsAgainstAnActualDB() {

        repo.findAll().forEach(iTestEO -> assertTrue(iTestEO.getName().contains("name")));

    }


}
