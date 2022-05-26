import 'package:desafio_studio_sol/src/services/api.dart';
import 'package:desafio_studio_sol/src/services/api_graphql_impl.dart';
import 'package:flutter/material.dart';

ValueNotifier<API> api = ValueNotifier(
    APIGraphQL('https://us-central1-ss-devops.cloudfunctions.net/GraphQL'));
