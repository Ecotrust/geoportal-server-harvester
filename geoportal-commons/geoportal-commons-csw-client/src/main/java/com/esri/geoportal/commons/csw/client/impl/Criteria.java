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
package com.esri.geoportal.commons.csw.client.impl;

import com.esri.core.geometry.Envelope;
import com.esri.core.geometry.Operator;
import com.esri.geoportal.commons.csw.client.ICriteria;
import java.util.Date;

/**
 * Criteria implementation.
 */
public class Criteria implements ICriteria {
  private int startPosition;
  private int maxRecords;
  private String searchText;
  private String searchIds;
  private Envelope envelope;
  private Operator.Type operation;
  private boolean liveDataAndMapsOnly;
  private Date fromDate;
  private Date toDate;

  @Override
  public int getStartPosition() {
    return startPosition;
  }

  /**
   * Sets start position.
   * @param startPosition start position
   */
  public void setStartPosition(int startPosition) {
    this.startPosition = startPosition;
  }

  @Override
  public int getMaxRecords() {
    return maxRecords;
  }

  /**
   * Sets max records.
   * @param maxRecords max records
   */
  public void setMaxRecords(int maxRecords) {
    this.maxRecords = maxRecords;
  }

  @Override
  public String getSearchText() {
    return searchText;
  }

  /**
   * Sets search text.
   * @param searchText search text 
   */
  public void setSearchText(String searchText) {
    this.searchText = searchText;
  }

  @Override
  public String getSearchIds() {
    return searchIds;
  }

  /**
   * Sets search IDs.
   * @param searchIds search IDs
   */
  public void setSearchIds(String searchIds) {
    this.searchIds = searchIds;
  }

  @Override
  public Envelope getEnvelope() {
    return envelope;
  }

  /**
   * Sets envelope.
   * @param envelope envelope
   */
  public void setEnvelope(Envelope envelope) {
    this.envelope = envelope;
  }

  @Override
  public Operator.Type getOperation() {
    return operation;
  }

  /**
   * Sets operation type.
   * @param operation operation type
   */
  public void setOperation(Operator.Type operation) {
    this.operation = operation;
  }

  @Override
  public boolean isLiveDataAndMapsOnly() {
    return liveDataAndMapsOnly;
  }

  /**
   * Sets to fetch live data and maps only.
   * @param liveDataAndMapsOnly <code>true</code> for live data and maps only
   */
  public void setLiveDataAndMapsOnly(boolean liveDataAndMapsOnly) {
    this.liveDataAndMapsOnly = liveDataAndMapsOnly;
  }

  @Override
  public Date getFromDate() {
    return fromDate;
  }

  /**
   * Sets from date.
   * @param fromDate from date
   */
  public void setFromDate(Date fromDate) {
    this.fromDate = fromDate;
  }

  @Override
  public Date getToDate() {
    return toDate;
  }

  /**
   * Sets to date.
   * @param toDate to date
   */
  public void setToDate(Date toDate) {
    this.toDate = toDate;
  }
}
