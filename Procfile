web: rake db:migrate && rake db:seed && bundle install && RUN --mount=type=cache,target=/root/.m2 mvn -o install  && bin/rails server -b 0.0.0.0 -p {PORT:3000} 
