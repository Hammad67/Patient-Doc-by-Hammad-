web: rake db:migrate && rake db:seed && bundle install && RUN --mount=type=bind,source=./.m2,target=/root/.m2,rw mvn -o install && bin/rails server -b 0.0.0.0 -p {PORT:3000} 
