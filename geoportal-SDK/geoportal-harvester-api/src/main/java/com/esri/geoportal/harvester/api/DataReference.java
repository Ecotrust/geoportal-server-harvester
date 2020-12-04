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
package com.esri.geoportal.harvester.api;

import java.io.Serializable;
import java.net.URI;
import java.util.Date;
import java.util.Map;

/**
 * Data reference. It provides access to data itself as well as vital data 
 * information.
 */
public interface DataReference extends Serializable, DataContent {
  
  /**
   * Gets data record id.
   * @return data record id
   */
  String getId();
  
  /**
   * Gets fetchable data record id.
   * Fetchable data id is a convenient id used to fetch a single data from the source.
   * @return fetchable data record id
   */
  String getFetchableId();
  
  /**
   * Gets last modified date.
   * @return last modified date or <code>null</code> if no date information available
   */
  Date getLastModifiedDate();
  
  /**
   * Gets source URI.
   * @return source URI
   */
  URI getSourceUri();
  
  /**
   * Gets broker URI.
   * @return broker URI.
   */
  URI getBrokerUri();
  
  /**
   * Gets broker name if any.
   * @return broker name or <code>null</code> if no broker name
   */
  String getBrokerName();
  
  /**
   * Gets attributes map.
   * @return attributes map
   */
  Map<String,Object> getAttributesMap();
  
  /**
   * Gets origin data reference.
   * @return origin data reference
   */
  DataReference getOriginDataReference();
  
  /**
   * Gets input broker database reference.
   * @return input broker reference or <code>null</code> if ad-hoc
   */
  String getInputBrokerRef();
  
  /**
   * Gets task database reference.
   * @return task reference of <code>null</code> if ad-hoc
   */
  String getTaskRef();
}
