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
package com.esri.geoportal.harvester.rest;

import com.esri.geoportal.harvester.api.BrokerDefinition;
import com.esri.geoportal.harvester.engine.BrokerInfo;
import com.esri.geoportal.harvester.beans.EngineBean;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Broker controller
 */
@RestController
public class BrokerController {
    
  @Autowired
  private EngineBean engine;
  
  /**
   * Lists all input brokers.
   * @return array of broker infos
   */
  @RequestMapping(value = "/rest/harvester/brokers/input", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
  public BrokerInfo[] listInputBrokers() {
    return engine.getInboundBrokersDefinitions().toArray(new BrokerInfo[0]);
  }
  
  /**
   * Lists all output brokers.
   * @return array of brokers infos
   */
  @RequestMapping(value = "/rest/harvester/brokers/output", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
  public BrokerInfo[] listOutputBrokers() {
    return engine.getOutboundBrokersDefinitions().toArray(new BrokerInfo[0]);
  }
  
  /**
   * Get a single broker.
   * @param brokerId broker id
   * @return broker info or <code>null</code> if no broker found
   */
  @RequestMapping(value = "/rest/harvester/brokers/{brokerId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
  public BrokerInfo getBroker(@PathVariable UUID brokerId) {
    return engine.findBroker(brokerId);
  }
  
  /**
   * Deletes a broker.
   * @param brokerId broker id
   * @return broker info
   */
  @RequestMapping(value = "/rest/harvester/brokers/{brokerId}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
  public BrokerInfo deleteBroker(@PathVariable UUID brokerId) {
    BrokerInfo brokerInfo = engine.findBroker(brokerId);
    if (brokerInfo!=null) {
      engine.deleteBroker(brokerId);
    }
    return brokerInfo;
  }
  
  /**
   * Adds a new task.
   * @param brokerDefinition
   * @return broker info of the newly created broker
   */
  @RequestMapping(value = "/rest/harvester/brokers", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
  public BrokerInfo createBroker(@RequestBody BrokerDefinition brokerDefinition) {
    return engine.createBroker(brokerDefinition);
  }
  
  /**
   * Adds a new task.
   * @param brokerDefinition
   * @return broker info of the task which has been replaced
   */
  @RequestMapping(value = "/rest/harvester/brokers/{brokerId}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
  public BrokerInfo updateBroker(@RequestBody BrokerDefinition brokerDefinition, @PathVariable UUID brokerId) {
    return engine.updateBroker(brokerId, brokerDefinition);
  }
  
}
