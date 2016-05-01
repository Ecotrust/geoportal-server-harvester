/*
 * Copyright 2016 Esri, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.esri.geoportal.harvester.console;

import com.esri.geoportal.harvester.api.ConnectorTemplate;
import com.esri.geoportal.harvester.api.InvalidDefinitionException;
import com.esri.geoportal.harvester.api.OutputConnector;

/**
 * Console connector.
 */
public class ConsoleConnector implements OutputConnector<ConsoleBroker,ConsoleDefinition> {

  @Override
  public ConnectorTemplate getTemplate() {
    return new ConnectorTemplate("CONSOLE", "Console output", null);
  }

  @Override
  public ConsoleBroker createBroker(ConsoleDefinition definition) throws InvalidDefinitionException {
    return new ConsoleBroker();
  }
  
}
