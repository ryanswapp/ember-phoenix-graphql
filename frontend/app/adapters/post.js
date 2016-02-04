import config from '../config/environment';
import GraphQLAdapter from 'ember-graphql-adapter';

export default GraphQLAdapter.extend({
  endpoint: `${config.apiHost}/api/post`
});
